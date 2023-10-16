//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q4a_ud_miner
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will have the miners random walk
     occasionally, and speak a random line when
     spoken to.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
       // Have them occasionally random walk.
       if(Random(100) > 70)
          ActionRandomWalk();
       else
          ClearAllActions();
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {
       object oDonan = GetObjectByTag("q4a_donan");
       int iQuest = GetLocalInt(oDonan, "mines_done");

       // If the mine quests have been done.
       if(iQuest == 2)
       {
          //SpeakString("[NOT IN STRING EDITOR] Praise " + GetName(GetLastSpeaker()) + "!");
       }
       else {
          int iRandom = Random(5);

          switch(iRandom){
            case 1:
               //SpeakString("[NOT IN STRING EDITOR] I barely escaped from the attack.");
               return;
            case 2:
               //SpeakString("[NOT IN STRING EDITOR] How will I earn money for my family now?");
               return;
            case 3:
               //SpeakString("[NOT IN STRING EDITOR] I have never seen the Shadows with so much power.");
               return;
            default:
               //SpeakString("[NOT IN STRING EDITOR] I'm just thankful to be alive.");
               return;
          }
       }
    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

