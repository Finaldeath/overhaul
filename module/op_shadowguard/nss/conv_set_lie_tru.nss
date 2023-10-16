void main()
{
    if (GetLocalInt(OBJECT_SELF, "N_LIED_TO") == 0)
    {
        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 5);
    }

    SetLocalInt(OBJECT_SELF, "N_LIED_TO", 1);
}
