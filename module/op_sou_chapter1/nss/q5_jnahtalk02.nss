// the player has mentioned he knows about J'Nah
// and has been sent by J'Nah to kill Tymofarrar

void main()
{
    int nPlot = GetLocalInt(GetObjectByTag("NW_DRGWHITE001"), "q5_Jnah_Talk");

    if (nPlot < 2)
    {
        SetLocalInt(GetObjectByTag("NW_DRGWHITE001"), "q5_Jnah_Talk", 2);
    }
}
