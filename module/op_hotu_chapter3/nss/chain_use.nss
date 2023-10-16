//::///////////////////////////////////////////////
//:: Name chain_use
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will add a little atmosphere to
     the grapple chains.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 6, 2003
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetLastUsedBy(), ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 2.9));
    DelayCommand(0.7, PlaySound("as_cv_ropepully1"));
    //DelayCommand(3.1, SendMessageToPC(GetLastUsedBy(), "[NOT IN STRING EDITOR] After a few tugs, you determine that this chain is fairly sturdy."));
    DelayCommand(3.1, SendMessageToPCByStrRef(GetLastUsedBy(), 85518));
}
