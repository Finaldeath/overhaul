////Check if PC has Aarin's Amulet and has not killed the romance)

int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"GENDROMANCE") != 99 &&

              (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET2")));


    return iResult;
}
