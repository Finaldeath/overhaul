//::///////////////////////////////////////////////
//:: Name act_q2crak_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Djinni casts a spell - turn all the Rakshasa back to their true form
(actual transformation handled in last dialog node).
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 21/03
//:://////////////////////////////////////////////

void main()
{
    //ActionPauseConversation();
    object oDjinn = GetObjectByTag("q2cdjinn");
    AssignCommand(oDjinn, ActionCastFakeSpellAtLocation(SPELL_SOUND_BURST, GetLocation(OBJECT_SELF)));
    //DelayCommand(3.0, ActionResumeConversation());
}
