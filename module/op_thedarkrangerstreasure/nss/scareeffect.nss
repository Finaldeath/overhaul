//::///////////////////////////////////////////////
//:: Scare Effect Heartbeat Script
//:: scareeffect
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Apply the Scare VFX to the object.
*/
//:://////////////////////////////////////////////

void main()
{
    int iDoOnce = GetLocalInt(OBJECT_SELF, "DoOnce");

    if (iDoOnce == FALSE)
    {
        effect eScare = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eScare, OBJECT_SELF, 999999.9);
        SetLocalInt(OBJECT_SELF, "DoOnce", TRUE);
    }
}
