//Take Piper's sword from the PC
void main()
{
    object oSword = GetItemPossessedBy(GetPCSpeaker(), "q1bpipersword");

    DestroyObject(oSword);
}
