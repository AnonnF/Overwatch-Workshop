rule "Start Auto Aiming":
    @Event eachPlayer
    @Team all
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)
    
    eventPlayer.startFacing(
        direction = directionTowards(
            eventPlayer, 
            getRealClosestPlayer(eventPlayer, Team.ALL)
        ),
        turnRate = 1000,
        relativity = Relativity.TO_WORLD,
        reevaluation = FacingReeval.DIRECTION_AND_TURN_RATE
    )

rule "Stop Auto Aiming":
    @Event eachPlayer
    @Team all
    @Condition  not eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)

    eventPlayer.stopFacing()
