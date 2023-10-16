//::///////////////////////////////////////////////
//:: Name act_q2dformqn_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC Does want the Formians help in fighting the drow.
    Formians will dissappear -
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 25/03
//:://////////////////////////////////////////////

void main()
{
    object oArea = GetArea(OBJECT_SELF);
    location lEffect;
    object oFormian = GetFirstObjectInArea(oArea);
    while (oFormian != OBJECT_INVALID)
    {
        if (GetStringLeft(GetTag(oFormian), 11) == "q2d_cutform")
        {
            lEffect = GetLocation(oFormian);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(137), lEffect);
            if (GetLocalInt(oFormian, "nHoleCreated") != 1)
            {
                SetLocalInt(oFormian, "nHoleCreated", 1);
                CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_hole_s", lEffect);
            }
            DestroyObject(oFormian);
        }
        oFormian = GetNextObjectInArea(oArea);
    }
    SetLocalInt(GetModule(), "X2_Q2DFormiansHelp", 1);
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(137), GetLocation(OBJECT_SELF)));
    CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_hole_s", GetLocation(OBJECT_SELF));
    DestroyObject(OBJECT_SELF, 1.0);
}
