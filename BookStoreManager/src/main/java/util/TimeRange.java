package util;

import java.util.Date;

public class TimeRange {
    private Date from;
    private Date to;

    public TimeRange(Date from, Date to) {
        this.from = from;
        this.to = to;
    }
    public Date getFrom() { return from; }
    public Date getTo() { return to; }
    public void setFrom(Date from) { this.from = from; }
    public void setTo(Date to) { this.to = to; }
}
