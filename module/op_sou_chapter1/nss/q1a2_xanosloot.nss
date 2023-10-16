//Script adjusts the alignment of anyone who disturbs this item
//a little bit (1 point) toward chaos

void main()
{
    object oThief = GetLastDisturbed();
    string sName = GetName(oThief);

    if(!GetLocalInt(OBJECT_SELF, sName))   //The PC has not looted this chest already
    {
        if (GetLocalInt(oThief, "X1_XanosLootOk") != 1)
        {
            AdjustAlignment(oThief, ALIGNMENT_CHAOTIC, 1);
            SetLocalInt(OBJECT_SELF, sName, 1);
        }
    }


}
