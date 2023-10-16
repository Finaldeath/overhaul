void main()
{
    object oFarmer = GetObjectByTag("M2Q1CFARMER");
    object oFarmerWife = GetObjectByTag("M2Q1CFARMWIFE");
    object oEncounter = GetObjectByTag("M2Q1CHALJAL");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if(    ((GetEnteringObject() == oFarmer) || (GetEnteringObject() == oEncounter) && GetIsObjectValid(oPC))
        && (GetDistanceBetween(oFarmer,oPC) < 10.0)
        && (GetDistanceBetween(oFarmer,oEncounter) < 5.0)
        && (GetLocalInt(GetModule(),"M2Q1FarmerHaljalAmbient") == 0)  )
    {
        AssignCommand(oFarmer,ClearAllActions());
        AssignCommand(oEncounter,ClearAllActions());
        SignalEvent(oFarmer,EventUserDefined(200));
    }
    
    if(    (((GetEnteringObject() == oFarmerWife) || (GetEnteringObject() == oEncounter)) && GetIsObjectValid(oPC))
        && (GetDistanceBetween(oFarmerWife,oPC) < 10.0)
        && (GetDistanceBetween(oFarmerWife,oEncounter) < 5.0)
        && (GetLocalInt(GetModule(),"M2Q1FarmerWifeHaljalAmbient") == 0)  )
    {
        AssignCommand(oFarmerWife,ClearAllActions());
        AssignCommand(oEncounter,ClearAllActions());
//*        SpeakString(FloatToString(GetDistanceBetween(oFarmerWife,oPC)));
        SignalEvent(oFarmerWife,EventUserDefined(204));
    }
}
