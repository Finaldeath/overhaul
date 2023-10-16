// Planetar appears and attack if the player killed the deva

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void CreatePlanetar(location lLoc, object oPC)
{
    object oPlanetar = CreateObject(OBJECT_TYPE_CREATURE, "q3c_planetar", lLoc);
    DelayCommand(3.0, AssignCommand(oPlanetar, Talk(oPC)));
}

void main()
{
    object oDeva = GetObjectByTag("q3c_Lavoera");
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    if(GetLocalInt(GetArea(OBJECT_SELF), "DEVA_KILLED") == 1)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_PLANETAR_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_PLANETAR_ONCE", 1);

        object oWP = GetWaypointByTag("q3c_wp_planetar");
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
        DelayCommand(3.0, CreatePlanetar(GetLocation(oWP), oPC));
        AssignCommand(oPC, ClearAllActions());
    }
}
