//::///////////////////////////////////////////////
//:: Mercenary Custom User Defined Event
//:: 2q4_kurthmen_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the characters say a speak string when
    they are fighting.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "nw_i0_2q4luskan"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(GetIsFighting(OBJECT_SELF))
        {
            if(d100() > 75)
            {
                SpeakOneLinerConversation("2q4_feuding");
                //SpeakOneLinerConversation();
            }
        }
    }
}

