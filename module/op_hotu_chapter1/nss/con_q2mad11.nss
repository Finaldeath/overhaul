//::///////////////////////////////////////////////
//:: con_q2Mad7
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if player told by Mother Salinka to
    ask Argali about special item
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
void main()
{

}

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_ARGALIITEM")>0;
    return iResult;
}
