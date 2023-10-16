//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set that PC has answered a question.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 7, 2003
//:://////////////////////////////////////////////
void main()
{
    int iMummy = GetLocalInt(GetPCSpeaker(),"X1_MUMMYQUESTIONS");
    SetLocalInt(GetPCSpeaker(), "X1_MUMMYQUESTIONS",iMummy+10);
}
