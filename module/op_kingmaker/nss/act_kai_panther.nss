//::///////////////////////////////////////////////
//:: act_kai_panther
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala turns into a panther
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    effect ePoly = EffectPolymorph(POLYMORPH_TYPE_PANTHER);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,ePoly,OBJECT_SELF);
    SetLocalInt(OBJECT_SELF,"OS_KAI_SHAPE",10);
}
