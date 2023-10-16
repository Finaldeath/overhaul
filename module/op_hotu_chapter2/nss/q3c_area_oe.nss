#include "x2_inc_restsys"
#include "x0_i0_henchman"

void AutoSave()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE", 1);

    DoSinglePlayerAutoSave();
}

// re-hire deva if she was hired before
void CheckDeva(object oPC)
{
    object oDeva = GetNearestObjectByTag("q3c_Lavoera", oPC);
    if(oDeva != OBJECT_INVALID && GetLocalInt(oDeva, "X2_JUST_A_FOLLOWER") == TRUE
        && GetMaster(oDeva) == OBJECT_INVALID)
    {
        AddHenchman(oPC, oDeva);
        SetIsFollower(oDeva, TRUE);
        SetLocalInt(oDeva, "X2_JUST_A_FOLLOWER", TRUE);
    }
}

void main()
{
    if (GetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT") != TRUE)
    {
        SetLocalString(OBJECT_SELF, "X2_WM_ENCOUNTERTABLE", "CultInnerSanctum");
        //SetLocalInt(OBJECT_SELF, "X2_WM_AREA_USEDOORS", 1);
        SetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT",TRUE);
    }

    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    CheckDeva(oPC);
    AutoSave();
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    object oRunes = GetObjectByTag("q3c_RuneCircle");
    object oMachine = GetObjectByTag("q3c_apparatus");
    effect eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oRunes);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oMachine);

    int i = 1;
    object oRune = GetObjectByTag("q3c_barrier", i);
    eVis = EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR);


    while(oRune != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oRune);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oRune);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oRune);
        i++;
        oRune = GetObjectByTag("q3c_barrier", i);
    }

    effect eVis1 = EffectVisualEffect(VFX_DUR_SPELLTURNING);
    effect eVis2 = EffectVisualEffect(VFX_DUR_BLUR);
    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    while(oObject != OBJECT_INVALID)
    {
        if(GetStringLeft(GetTag(oObject), 16) == "ElectricPedestal")
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis1, oObject);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis2, oObject);
        }
        oObject = GetNextObjectInArea(OBJECT_SELF);
    }





}
