//::///////////////////////////////////////////////
//:: act_beg_gavecoin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The pc has given the beggar some coin
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    int iBeggers = GetLocalInt(OBJECT_SELF, "OS_BEGGAR_FISH");
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_GOOD, 1);

    if (iBeggers < 10)
    {
        SetLocalInt(OBJECT_SELF, "OS_BEGGAR_FISH",10);
        SetLocalInt(GetModule(), "OS_BEGGAR_FISH",10);
    }
}
