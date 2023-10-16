//::///////////////////////////////////////////////
//:: Name q4a_stat_trig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will give feedback to the players
     that the doorway is being blocked.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 14, 2003
//:://////////////////////////////////////////////

void main()
{
   if(GetIsPC(GetEnteringObject()))
      //AssignCommand(GetEnteringObject(), SpeakString("[NOT IN STRING EDITOR] The way is blocked by these statues."));
      SendMessageToPCByStrRef(GetEnteringObject(), 85513);
}
