void main()
{
    object oFarmerWife = GetObjectByTag("M2Q1CFARMWIFE");
    object oFarmerDaughter = GetObjectByTag("M2Q1CFARMDAU");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if((GetEnteringObject() == oFarmerWife || GetEnteringObject() == oFarmerDaughter) &&
        GetIsObjectValid(oPC) &&
        GetDistanceBetween(oFarmerWife,oPC) < 10.0 &&
        GetDistanceBetween(oFarmerWife,oFarmerDaughter) < 5.0 &&
        GetLocalInt(GetModule(),"M2Q1FarmerWifeDaughterAmbient") == 0)
    {
        AssignCommand(oFarmerWife,ClearAllActions());
        AssignCommand(oFarmerDaughter,ClearAllActions());
        SignalEvent(oFarmerWife,EventUserDefined(201));
    }
}
