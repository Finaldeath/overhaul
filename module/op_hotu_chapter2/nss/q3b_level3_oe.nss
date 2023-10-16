// Adjust Armand's speed
#include "x2_inc_restsys"

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
    if (GetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT") != TRUE)
    {
        SetLocalString(OBJECT_SELF, "X2_WM_ENCOUNTERTABLE", "CultTemple3");
        //SetLocalInt(OBJECT_SELF, "X2_WM_AREA_USEDOORS", 1);
        SetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT",TRUE);
    }
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    AutoSave();
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    effect eSpeed = EffectMovementSpeedIncrease(50);
    object oArmand = GetObjectByTag("q3_armand");
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSpeed, oArmand);
    effect eHaste = EffectHaste();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHaste, oArmand);
    //AdjustReputation(oPC, oArmand, -100);
    //AdjustReputation(oArmand, oPC, -100);

}
