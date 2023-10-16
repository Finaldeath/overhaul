//::///////////////////////////////////////////////
//:: Gem Conversation End
//:: act_gem_end
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The end of each gem conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oGem = GetItemPossessedBy(oPC,"q3_psionicgem");
    int nGem = GetLocalInt(oPC,"OS_PSIONIC_GEM")+1;
    SetLocalInt(oPC,"OS_PSIONIC_GEM",nGem);
    DestroyObject(oGem);
    DelayCommand(0.1,DestroyObject(OBJECT_SELF));
}
