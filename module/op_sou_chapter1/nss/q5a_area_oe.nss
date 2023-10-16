// doing two things: starting the dialog between the kobolds at the entrance and placing the
// platform for the blocked passage.

void DoKoboldTalk()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_KOBOLD_TALK_ENTRANCE_ONCE");
    if(nDoOnce == 1)
      return;
    SetLocalInt(OBJECT_SELF, "DO_KOBOLD_TALK_ENTRANCE_ONCE", 1);

    object oKobold1 = GetObjectByTag("Q5_KOBOLD_ENTRANCE1");
    object oKobold2 = GetObjectByTag("Q5_KOBOLD_ENTRANCE2");

    if(GetIsInCombat(oKobold1) || GetIsInCombat(oKobold2))
        return;
    AssignCommand(oKobold1, ActionStartConversation(oKobold2, "q5_kobolds_ent"));
}

void main()
{

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        if (GetLocalInt(OBJECT_SELF, "Q5_LEVERUSED") == 1 || GetLocalInt(OBJECT_SELF, "Q5A_TIMES_USED") == 7)
        {
            effect eVis = EffectVisualEffect(358);
            location lPlatform = GetLocalLocation(OBJECT_SELF, "lMaxLowerPlatform");
            ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lPlatform);
        }
        if (GetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE") != 1)
        {
            SetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE", 1);
            DoSinglePlayerAutoSave();

        }

    }
    DoKoboldTalk();
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CREATE_ONCE");
    if(nDoOnce == 1)
      return;
    SetLocalInt(OBJECT_SELF, "DO_CREATE_ONCE", 1);

    object oWP = GetWaypointByTag("Q5A_WP_PLATFORM");
    vector vPos = GetPosition(oWP);
    vPos.z = 2.0;
    location lPlatformLoc = Location(OBJECT_SELF, vPos, 0.0);
    vPos.z += 0.6;
    location lChainLoc = Location(OBJECT_SELF, vPos, 0.0);
    object oPlatform = CreateObject(OBJECT_TYPE_PLACEABLE, "q5a_platform", lPlatformLoc);
    object oChain = CreateObject(OBJECT_TYPE_PLACEABLE, "q5a_chain1", lChainLoc);
}
