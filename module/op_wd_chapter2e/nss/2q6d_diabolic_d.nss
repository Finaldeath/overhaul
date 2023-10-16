//::///////////////////////////////////////////////
//:: Diabolic Custom User Defined Event
//:: 2q6d_diabolic_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the imps and quasits say one liners.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(d100() > 65)
        {
            SpeakOneLinerConversation();
        }
    }
}

