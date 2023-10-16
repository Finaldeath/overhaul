//::///////////////////////////////////////////////
//:: M3Q2C05_DOG_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the dog to whine when he sees the player.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser == 1002)
    {
        if(GetIsPC(GetLastPerceived()))
        {
            ActionStartConversation(OBJECT_SELF);
        }
    }
}
