void main()
{
    object oFarmer = GetObjectByTag("M2Q1CFARMER");
    object oNeurik = GetObjectByTag("M2Q1CNEURIK");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if((GetEnteringObject() == oFarmer || GetEnteringObject() == oNeurik) &&
        GetIsObjectValid(oPC) &&
        GetDistanceBetween(oFarmer,oPC) < 10.0 &&
        GetDistanceBetween(oFarmer,oNeurik) < 10.0 &&
        GetLocalInt(GetModule(),"M2Q1FarmerNeurikAmbient") == 0)
    {
        AssignCommand(oFarmer,ClearAllActions());
        AssignCommand(oNeurik,ClearAllActions());
        SignalEvent(oFarmer,EventUserDefined(201));
    }
}
