//::///////////////////////////////////////////////
//:: q6_medusa99y
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets medusa riddle state to 99,
    DOES NOT GIVE MIRROR SHARD TO PLAYER
    States:
    10 - riddle challenge given
    20 - First riddle failed
    30 - Second riddle failed
    99 - Riddle game over
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 05, 2003
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(OBJECT_SELF,"q6_Medusa")<=99)
        {
        SetLocalInt(OBJECT_SELF,"q6_Medusa",99);
        }
}

