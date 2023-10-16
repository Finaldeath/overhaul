void main()
{
    object oFarmer = GetObjectByTag("M2Q1CFARMER");
    object oFarmerWife = GetObjectByTag("M2Q1CFARMWIFE");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if((GetEnteringObject() == oFarmer || GetEnteringObject() == oFarmerWife) &&
        GetIsObjectValid(oPC) &&
        GetDistanceBetween(oFarmer,oPC) < 10.0 &&
        GetDistanceBetween(oFarmer,oFarmerWife) < 5.0 &&
        GetLocalInt(GetModule(),"M2Q1FarmerWifeAmbient") == 0)
    {
        AssignCommand(oFarmer,ClearAllActions());
        AssignCommand(oFarmerWife,ClearAllActions());
        SignalEvent(oFarmer,EventUserDefined(204));
    }
}
