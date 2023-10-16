//::///////////////////////////////////////////////
//:: bk_pill_spwn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    First time heartbeat runs, apply
    "sunlight" visual to object
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "cover") == 0)
    {
        SetLocalInt(OBJECT_SELF, "cover", 1);
        effect eVis = EffectVisualEffect(414);
       // * removed the light effect. Didn't really seem necessary
     //   ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
    }
}
