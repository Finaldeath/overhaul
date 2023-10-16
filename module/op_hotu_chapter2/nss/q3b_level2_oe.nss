// on-enter event for level 2 of the cult temple.
#include "x2_inc_restsys"

void RemoveEffects(object oObject)
{
    effect e = GetFirstEffect(oObject);
    while(GetIsEffectValid(e))
    {
        RemoveEffect(oObject, e);
        e = GetNextEffect(oObject);
    }
}

void main()
{
    if (GetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT") != TRUE)
    {
        SetLocalString(OBJECT_SELF, "X2_WM_ENCOUNTERTABLE", "CultTemple2");
        //SetLocalInt(OBJECT_SELF, "X2_WM_AREA_USEDOORS", 1);
        SetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT",TRUE);
    }
    object oPC = GetEnteringObject();
    object oStatue1 = GetNearestObjectByTag("q3b_statue1", oPC);
    object oStatue2 = GetNearestObjectByTag("q3b_statue2", oPC);

    if(!GetIsPC(oPC))
        return;

    //RemoveEffects(oStatue1);
    //RemoveEffects(oStatue2);

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oAltar = GetObjectByTag("q3b_altar");
    effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oAltar);
}
