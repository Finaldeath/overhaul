void main()
{
    object oFarmer = GetObjectByTag("M2Q1CFARMER");
    object oFarmerWife = GetObjectByTag("M2Q1CFARMWIFE");
    object oFarmerDaughter = GetObjectByTag("M2Q1CFARMDAU");
    object oFarmerSon = GetObjectByTag("M2Q1CFARMSON");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if ((GetEnteringObject() == oFarmer || GetEnteringObject() == oFarmerSon) &&
        GetIsObjectValid(oPC) &&
        GetDistanceBetween(oFarmer,oPC) < 10.0 &&
        GetDistanceBetween(oFarmer,oFarmerSon) < 5.0 &&
        GetLocalInt(GetModule(),"M2Q1FarmerSonAmbient") == 0)
    {
        AssignCommand(oFarmer,ClearAllActions());
        AssignCommand(oFarmerSon,ClearAllActions());
        SignalEvent(oFarmer,EventUserDefined(202));
    }
    if ((GetEnteringObject() == oFarmerWife || GetEnteringObject() == oFarmerSon) &&
        GetIsObjectValid(oPC) &&
        GetDistanceBetween(oFarmerWife,oPC) < 10.0 &&
        GetDistanceBetween(oFarmerWife,oFarmerSon) < 5.0 &&
        GetLocalInt(GetModule(),"M2Q1FarmerWifeSonAmbient") == 0)
    {
        AssignCommand(oFarmerWife,ClearAllActions());
        AssignCommand(oFarmerSon,ClearAllActions());
        SignalEvent(oFarmerWife,EventUserDefined(200));
    }
    if ((GetEnteringObject() == oFarmerDaughter || GetEnteringObject() == oFarmerSon) &&
        GetIsObjectValid(oPC) &&
        GetDistanceBetween(oFarmerDaughter,oPC) < 10.0 &&
        GetDistanceBetween(oFarmerDaughter,oFarmerSon) < 5.0 &&
        GetLocalInt(GetModule(),"M2Q1FarmerSonDaughterAmbient") == 0)
    {
        AssignCommand(oFarmerDaughter,ClearAllActions());
        AssignCommand(oFarmerSon,ClearAllActions());
        SignalEvent(oFarmerSon,EventUserDefined(200));
    }
}
