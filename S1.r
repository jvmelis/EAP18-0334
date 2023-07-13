# Read data now
dry_season <- read.csv("DataS2.csv")
moist_season <- read.csv("DataS1.csv")
dry_season$Grass_cov[dry_season$Grass_cov<30]<-0
dry_season$Grass_cov[dry_season$Grass_cov>0]<-1

if(!require(piecewiseSEM)){install.packages("piecewiseSEM")}
if(!require(tidyverse)){install.packages("tidyverse")}

# Density = `density`
### `dry_season` = dry season
dry_season_SEM <-psem(
  lm(Canopy~Basal_Area, dry_season),
  lm(litter~Basal_Area+Canopy, dry_season),
  glm(Grass_cov~Canopy+litter, dry_season, family = binomial('logit')),
  glm(density~Grass_cov+Basal_Area, dry_season, family = poisson)
)
summary(dry_season_SEM)
#  density ~ Canopy  
#  density ~ litter
dry_season_SEM <-psem(
  lm(Canopy~Basal_Area, dry_season),
  lm(litter~Basal_Area+Canopy, dry_season),
  glm(Grass_cov~Canopy+litter, dry_season, family = binomial('logit')),
  glm(density~Canopy+litter+Grass_cov+Basal_Area, dry_season, family = poisson)#,
)
summary(dry_season_SEM)
summary(dry_season_SEM)$Cstat ##C de fisher = 2.35 e p-valor=0.309
coefs(dry_season_SEM, standardize = 'scale')
# `beta` = `Std.Estimate` (values in arrows) + `p-value` .

# Species Richness = `richness`
dry_season_riq <- psem(
  lm(Canopy~Basal_Area, dry_season),
  lm(litter~Basal_Area+Canopy, dry_season),
  glm(Grass_cov~Canopy+litter, dry_season, family = binomial('logit')),
  glm(richness~Grass_cov+Basal_Area, dry_season, family = poisson)#,
)
summary(dry_season_riq)
summary(dry_season_riq)$Cstat

dry_season_riq <- psem(
  lm(Canopy~Basal_Area, dry_season),
  lm(litter~Basal_Area+Canopy, dry_season),
  glm(Grass_cov~Canopy+litter, dry_season, family = binomial('logit')),
  glm(richness~Canopy+Grass_cov+Basal_Area, dry_season, family = poisson)
)
summary(dry_season_riq)$Cstat

coefs(dry_season_riq, standardize = 'scale')

## Rainy season = `moist_season`

### `density` = density
moist_season_dens <- psem(
  lm(Canopy~Basal_Area, moist_season),
  lm(litter~Basal_Area+Canopy, moist_season),
  glm(Grass_cov~Canopy+litter, moist_season, family = binomial('logit')),
  glm(density~Grass_cov+Basal_Area, moist_season, family = poisson)
)
summary(moist_season_dens)
summary(moist_season_dens)$Cstat

moist_season_dens <- psem(
  lm(Canopy~Basal_Area, moist_season),
  lm(litter~Basal_Area+Canopy, moist_season),
  glm(Grass_cov~Canopy+litter, moist_season, family = binomial('logit')),
  glm(density~Canopy+Grass_cov+Basal_Area, moist_season, family = poisson)
)
summary(moist_season_dens)$Cstat

moist_season_dens <- psem(
  lm(Canopy~Basal_Area, moist_season),
  lm(litter~Basal_Area+Canopy, moist_season),
  glm(density~Canopy+Basal_Area, moist_season, family = poisson)
)
summary(moist_season_dens)$Cstat

coefs(moist_season_dens, standardize = 'scale')

### Species richness = `richness`
moist_season_riq <- psem(
  lm(Canopy~Basal_Area, moist_season),
  lm(litter~Basal_Area+Canopy, moist_season),
  glm(Grass_cov~Canopy+litter, moist_season, family = binomial('logit')),
  glm(richness~Grass_cov+Basal_Area, moist_season, family = poisson)
)
summary(moist_season_riq)

moist_season_riq <- psem(
  lm(Canopy~Basal_Area, moist_season),
  lm(litter~Basal_Area+Canopy, moist_season),
  glm(richness~Canopy+Basal_Area, moist_season, family = poisson)
)
summary(moist_season_riq)
summary(moist_season_riq)$Cstat
coefs(moist_season_riqstandardize = 'scale')
