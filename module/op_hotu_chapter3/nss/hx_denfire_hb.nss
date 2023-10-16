//::///////////////////////////////////////////////
//:: Name hx_denfire_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will damage anyone in the fire pit.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On:Sept 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_appear"
// Do fire damage to anyone in the fire pit.
void DoFireDamage();
// Check if they are a flyer.
int CheckFlier(object oObject);

void main()
{
    // Only active if PC is in area.
    if(GetArea(GetFirstPC()) == GetArea(OBJECT_SELF))
    {
        DoFireDamage();
        DelayCommand(0.5, DoFireDamage());
        DelayCommand(1.0, DoFireDamage());
        DelayCommand(1.5, DoFireDamage());
        DelayCommand(2.0, DoFireDamage());
        DelayCommand(2.5, DoFireDamage());
        DelayCommand(3.0, DoFireDamage());
        DelayCommand(3.5, DoFireDamage());
        DelayCommand(4.0, DoFireDamage());
        DelayCommand(4.5, DoFireDamage());
        DelayCommand(5.0, DoFireDamage());
        DelayCommand(5.5, DoFireDamage());
    }
}

// Damage anyone in the fire radius.
void DoFireDamage()
{
    object oObject = GetFirstObjectInShape(SHAPE_SPHERE, 13.0, GetLocation(OBJECT_SELF));

    int iRandom = Random(100) + 50;

    while(GetIsObjectValid(oObject))
    {
        // Do damage if not flying over.
        if(CheckFlier(oObject) == FALSE)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iRandom, DAMAGE_TYPE_FIRE), oObject);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oObject);
        }
        oObject = GetNextObjectInShape(SHAPE_SPHERE, 13.0, GetLocation(OBJECT_SELF));
    }
}
