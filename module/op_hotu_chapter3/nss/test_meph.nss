void main()
{
    object oBuild = GetNearestObjectByTag("hx_meph_building");
    int x = GetLocalInt(OBJECT_SELF, "hx_destroy");
    int iRandom = Random(100);
    location lLoc = GetLocation(GetObjectByTag("hx_meph_start_wp"));
    object oPC = GetLastUsedBy();

    SetLocalInt(GetModule(), "bKnower_MephistophelesNamed", TRUE);

    if(iRandom >= 0)
    {
        //SetLocalInt(OBJECT_SELF, "hx_destroy", 1);
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oBuild);
        //DelayCommand(0.0, SignalEvent(oBuild, EventUserDefined(4444)));
        CreateObject(OBJECT_TYPE_CREATURE, "hx_meph", lLoc);
        DelayCommand(3.0, AssignCommand(GetObjectByTag("hx_meph"), ActionStartConversation(oPC)));
    }
    else if(iRandom <= 50)
    {
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ICESTORM), oBuild);
        DelayCommand(0.0, SignalEvent(oBuild, EventUserDefined(5555)));
    }
    else
    {
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STORM), oBuild);
        DelayCommand(0.0, SignalEvent(oBuild, EventUserDefined(6666)));
    }
}
