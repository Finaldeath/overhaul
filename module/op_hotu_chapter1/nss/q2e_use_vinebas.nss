//::///////////////////////////////////////////////
//:: Name q2e_use_vinebas
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start a conversation with whoever last used me
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void main()
{
    ActionStartConversation(GetLastUsedBy());
}
