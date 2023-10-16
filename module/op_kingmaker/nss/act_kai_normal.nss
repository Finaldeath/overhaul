//::///////////////////////////////////////////////
//:: act_kai_normal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns Kaidala to normal
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"OS_KAI_SHAPE",0);
    effect eEff = GetFirstEffect(OBJECT_SELF) ;
    while (GetIsEffectValid(eEff))
    {
        RemoveEffect(OBJECT_SELF,eEff);
        eEff = GetNextEffect(OBJECT_SELF);
    }
}
