//::///////////////////////////////////////////////
//:: Name hx_explode_bould
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have a Grey Render pop out of the
     boulder when a PC gets near.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 13, 2003
//:://////////////////////////////////////////////
void DelayCreateObject(location lLoc);
void main()
{
    object oPC = GetFirstObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF),
                 TRUE, OBJECT_TYPE_CREATURE);
    location lLoc = GetLocation(OBJECT_SELF);

    while(GetIsObjectValid(oPC))
    {
        // If it is a PC, explode.
        if(GetIsPC(oPC))
        {
            PlaySound("");
            SetPlotFlag(OBJECT_SELF, FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(1000), OBJECT_SELF);
            DelayCommand(0.5, DelayCreateObject(lLoc));
            return;
        }
        oPC = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF),
                 TRUE, OBJECT_TYPE_CREATURE);
    }
}

void DelayCreateObject(location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, "hx_exploder", lLoc);
}
