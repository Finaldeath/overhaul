void main()
{
    object oFarmer = GetObjectByTag("M2Q1CFARMER");
    object oFarmerDaughter = GetObjectByTag("M2Q1CFARMDAU");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if((GetEnteringObject() == oFarmer || GetEnteringObject() == oFarmerDaughter) &&
        GetIsObjectValid(oPC) &&
        GetDistanceBetween(oFarmer,oPC) < 10.0 &&
        GetDistanceBetween(oFarmer,oFarmerDaughter) < 5.0 &&
        GetLocalInt(GetModule(),"M2Q1FarmerDaughterAmbient") == 0)
    {
        AssignCommand(oFarmer,ClearAllActions());
        AssignCommand(oFarmerDaughter,ClearAllActions());
        SignalEvent(oFarmer,EventUserDefined(203));
    }
}
