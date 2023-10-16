void main()
{
    if (GetIsDead(GetObjectByTag("M2Q1A02GETH")))
    {
        SetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT", 30);
    }
    ActionAttack(GetPCSpeaker());
}



