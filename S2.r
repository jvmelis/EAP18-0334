if(!require(tidyverse)){install.packages("tidyverse")}
if(!require(lme4)){install.packages("lme4")}                # lmer
if(!require(lsmeans)){install.packages("lsmeans")}          # lstrends
if(!require(multcompView)){install.packages('multcompView')}# 
if(!require(car)){install.packages('car')}                  # Anova
valores <- read.csv('DataS3.csv')

# Temporal dynamic Biomass
## Composition
lmer(log(TOTAL_WAGB)~ composicao*date+(date|Parcela), valores) %>%
  car::Anova() 
## Management
lmer(log(TOTAL_WAGB)~ manejo*date+(date|Parcela), valores) %>%
  car::Anova()
### Comparison `slopes`:
valores %>% ungroup %>% mutate(date=as.numeric(factor(date))) %>%
  with(lmer(log(TOTAL_WAGB) ~ manejo *date+(date|Parcela))) %>%
  lstrends(~manejo, var = "date") %>% cld(Letters=letters) 

### Plotting `slopes`:
valores %>% 
  ggplot(aes(x=as.numeric(date),
             y=log(TOTAL_WAGB), group=manejo, color=manejo))+geom_point()+
  geom_smooth(method="lm")+theme_classic()+facet_grid(.~manejo)

## Spacing
lmer(log(TOTAL_WAGB)~ espaca*date+(date|Parcela), valores) %>%
  car::Anova() 
### Comparing  `slopes`:
valores %>% ungroup %>% mutate(date=as.numeric(factor(date))) %>%
  with(lmer(log(TOTAL_WAGB) ~ espaca *date+(date|Parcela))) %>%
  lstrends(~espaca, var = "date")
### Plotting `slopes`:
valores %>% 
  ggplot(aes(x=as.numeric(date),
             y=log(TOTAL_WAGB), group=espaca, color=espaca))+geom_point()+
  geom_smooth(method="lm")+theme_classic()+facet_grid(.~espaca)

## Interaction `Spacing` and `Manejo`
lmer(log(TOTAL_WAGB)~ espaca*date*manejo+
               (date|Parcela), valores) %>% car::Anova() 
AIC(lmer(log(TOTAL_WAGB)~ espaca*date*manejo+(date|Parcela), valores),
    lmer(log(TOTAL_WAGB)~ date*manejo+(date|Parcela), valores),
    lmer(log(TOTAL_WAGB)~ espaca*date+(date|Parcela), valores))

# Only last year:
## Composition

(mod<-valores %>% filter(factor(date)==12) %>% 
    with(aov(log(TOTAL_WAGB) ~ composicao)) %>% summary()) 

valores %>% filter(factor(date)==12) %>%
  with(lm(log(TOTAL_WAGB) ~ composicao)) %>% residuals() %>% shapiro.test()

valores %>% filter(factor(date)==12) %>%
  ggplot(aes(x=composicao,y=log(TOTAL_WAGB)))+geom_boxplot()

## Manejo
(mod<-valores %>% filter(factor(date)==12) %>%
  with(aov(log(TOTAL_WAGB) ~ manejo)))
summary(mod)
TukeyHSD(mod)

valores %>% filter(factor(date)==12) %>%
  with(lm(log(TOTAL_WAGB) ~ manejo)) %>% residuals() %>% shapiro.test()
valores %>% filter(factor(date)==12) %>%
  ggplot(aes(x=manejo,y=log(TOTAL_WAGB)))+geom_boxplot()

## Espacamento
mod<-valores %>% filter(factor(date)==12) %>%
  with(aov(log(TOTAL_WAGB) ~ espaca))
summary(mod)
TukeyHSD(mod)

valores %>% filter(factor(date)==12) %>%
  with(lm(log(TOTAL_WAGB)~espaca)) %>% residuals() %>% shapiro.test()
valores %>% filter(factor(date)==12) %>%
  ggplot(aes(x=espaca,y=log(TOTAL_WAGB)))+geom_boxplot()

## Factor interaction
mod<-valores %>% filter(factor(date)==12) %>%
  with(aov(log(TOTAL_WAGB) ~ espaca*manejo))
summary(mod)
lsmeans(mod, ~espaca:manejo, 'tukey') %>% cld(Letters=letters)
TukeyHSD(mod,"espaca:manejo")

valores %>% filter(factor(date)==12) %>%
  ggplot(aes(x=espaca,y=log(TOTAL_WAGB), fill=manejo))+
  geom_boxplot()+theme_classic()+
  annotate("text",label=c("a", "a", "a", "b"), y=5, x=c(.75,1.25,1.75,2.25))
