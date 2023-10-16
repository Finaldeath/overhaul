// reveal the path for a paladin

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    if(GetLevelByClass(CLASS_TYPE_PALADIN, oPC) == 0)
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oWP = GetWaypointByTag("Q3D_DEVINE");
    effect eVis = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
    int n = 1;
    object oRubble = GetNearestObjectByTag("Q3B_RUBBLE", OBJECT_SELF, n);
    effect eDam = EffectDamage(1000);
    float fDelay = 0.5;
    while(oRubble != OBJECT_INVALID)
    {
        fDelay += 0.25;
        SetPlotFlag(oRubble, FALSE);
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oRubble));
        n++;
        oRubble = GetNearestObjectByTag("Q3B_RUBBLE", OBJECT_SELF, n);
    }
    AssignCommand(oPC, SpeakOneLinerConversation("q2d_paladin"));
}
