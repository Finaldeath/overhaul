//:://////////////////////////////////////////////////
//:: x2_deek_usrdef
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
    Henchman will check to see if someone has cast
      Raise Dead, Ressurection on her.
      If so - reward XP and give journal entry.
 */
//:://////////////////////////////////////////////////
//:://////////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: July 15/03/02
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "x2_inc_plot"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "X2_Leveled_Up") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "X2_Leveled_Up", 1);

        //Level up henchman to level 13
        int nLevel = 1;
        for (nLevel = 1; nLevel < 14; nLevel++)
        {
            LevelUpHenchman(OBJECT_SELF);
        }
    }


}

