//////Set Aribeth Surrender global to 2, Set Surrender object to PC Speaker
// Set at 2, it means she has surrendered but has not left for the cell yet

void main()
{
     SetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_SURRENDER",2);
     SetLocalObject(GetModule(), "M4Q01SURRENDER", GetPCSpeaker());

}

