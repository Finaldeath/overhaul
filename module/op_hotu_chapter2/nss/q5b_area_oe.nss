// Beholders caves on-enter event.

#include "nw_i0_generic"

void JumpBeholder(string sBP, location lLoc)
{
    object oBeholder = CreateObject(OBJECT_TYPE_CREATURE, sBP, lLoc, TRUE);
    DelayCommand(3.0, AssignCommand(oBeholder, DetermineCombatRound()));
}

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void SetupArea()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    effect eGlow = EffectVisualEffect(VFX_DUR_LIGHT_PURPLE_20);
    effect eGlow2 = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);
    while(oObject != OBJECT_INVALID)
    {
        if(GetTag(oObject) == "q5_glow")
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, oObject);
            //ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow2, oObject);
        }
        oObject = GetNextObjectInArea(OBJECT_SELF);
    }

}

void AutoSave()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE", 1);

    DoSinglePlayerAutoSave();
}

void main()
{
    if(GetLocalInt(OBJECT_SELF, "REST_INIT") == 0)
    {
        SetLocalString(OBJECT_SELF, "X2_WM_ENCOUNTERTABLE", "q5b_BeholderCaves");
        SetLocalInt(OBJECT_SELF, "REST_INIT", 1);
    }

    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    SetupArea();
    AutoSave();
    if(GetLocalInt(GetModule(), "X2Q5_HANDLED_BEBELITH") != 1)
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_BEHOLDERS_AMBUSH_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_BEHOLDERS_AMBUSH_ONCE", 1);

    int i = 1;
    float fDelay;
    object oBeholderWP = GetNearestObjectByTag("q5_beholder_wp_wait", oPC, i);
    while(oBeholderWP != OBJECT_INVALID)
    {
        DelayCommand(fDelay, JumpBeholder("q5_beholder", GetLocation(oBeholderWP)));
        fDelay += 0.5;
        i++;
        oBeholderWP = GetNearestObjectByTag("q5_beholder_wp_wait", oPC, i);
    }
    i = 1;
    fDelay = 0.0;
    oBeholderWP = GetNearestObjectByTag("q5_beholder_mage_wp_wait", oPC, i);
    while(oBeholderWP != OBJECT_INVALID)
    {
        DelayCommand(fDelay, JumpBeholder("q5_beholdermage", GetLocation(oBeholderWP)));
        fDelay += 0.5;
        i++;
        oBeholderWP = GetNearestObjectByTag("q5_beholder_mage_wp_wait", oPC, i);
    }


}
