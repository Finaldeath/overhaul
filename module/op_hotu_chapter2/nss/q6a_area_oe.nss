
#include "x2_inc_globals"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);
    effect eVis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);

    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    while(oObject != OBJECT_INVALID)
    {
        if(GetTag(oObject) == "q6_blocker")
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oObject);

        oObject = GetNextObjectInArea(OBJECT_SELF);
    }

}
