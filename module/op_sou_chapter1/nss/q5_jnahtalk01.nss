// the player has mentioned he knows about J'Nah

void main()
{
    int nPlot = GetLocalInt(GetObjectByTag("NW_DRGWHITE001"), "q5_Jnah_Talk");
    if (nPlot == 0)
    {
        SetLocalInt(GetObjectByTag("NW_DRGWHITE001"), "q5_Jnah_Talk", 1);
    }
}
