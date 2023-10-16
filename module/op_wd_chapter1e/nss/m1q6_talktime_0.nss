//::///////////////////////////////////////////////
//:: Checks that the character has not been spoken
//:: to before.
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF,"L_TALKTIMES") < 1;
}

