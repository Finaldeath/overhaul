// Starting condition after hive mother is dead

int StartingConditional()
{
    return GetLocalInt(GetModule(), "x2_plot_beholders_out") == 1;
}
