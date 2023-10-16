//::///////////////////////////////////////////////
//:: Name hx_mimic_conv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mimic conversation file for when it is
     clicked on.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 1, 2003
//:://////////////////////////////////////////////

void main()
{
    PlaySound("c_goblin_slct");
    DelayCommand(0.1, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 0.5));
    //DelayCommand(0.1, SpeakString("[NOT IN STRING EDITOR] Me go gem!"));
    DelayCommand(0.1, SpeakStringByStrRef(85500));
}
