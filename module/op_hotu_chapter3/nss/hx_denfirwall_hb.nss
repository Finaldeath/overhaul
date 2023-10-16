//::///////////////////////////////////////////////
//:: Name hx_denfirwall_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Shows a fire visual for the fire pit.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On:Sept 15, 2003
//:://////////////////////////////////////////////

void main()
{
    // Only active if PC is in area.
    if(GetArea(GetFirstPC()) == GetArea(OBJECT_SELF))
    {
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(349), OBJECT_SELF);
        }
    }
}
