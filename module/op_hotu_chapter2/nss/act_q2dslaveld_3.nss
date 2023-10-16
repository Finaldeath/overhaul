//::///////////////////////////////////////////////
//:: Name act_q2dslaveld_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Slave Leader and slaves launch their attack
    on the Illithid compound right now whenever
    the PC returns from the Grand Hall
    Variable = 2  - attack when area entered.
    Variable = 1  - attack after PC has entered the Grand Hall (set it to 2 on enter of that area)
    Variable = 0  - nothing's happenning

    Slaves should run off till then..
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 1/03
//:://////////////////////////////////////////////

void main()
{
       //Set a variable that the next time the PC enters
       //the main city - the uprising begins.

       SetLocalInt(GetModule(), "X2_Q2DSlaveUprising", 1);
       AddJournalQuestEntry("q2_slaverevolt",10,GetPCSpeaker());
      AddJournalQuestEntry("q2_zorvakmur",40,GetPCSpeaker());


}
