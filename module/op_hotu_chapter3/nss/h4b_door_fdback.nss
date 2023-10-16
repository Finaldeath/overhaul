//::///////////////////////////////////////////////
//:: Name h4b_door_fdback
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will give the PC a clue that the door
     must be dealt with some other way.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 5, 2003
//:://////////////////////////////////////////////

void main()
{
    PlaySound("as_dr_locked2");
    //DelayCommand(0.1, SpeakString("[NOT IN STRING EDITOR] The door is sealed by a magical barrier."));
    DelayCommand(0.1, SpeakStringByStrRef(100975));
}
