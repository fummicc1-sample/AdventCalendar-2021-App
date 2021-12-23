import SwiftUI

struct CalendarView: View {
    
    let year: Int
    @State private var selectedDate: Date? = nil
    @State private var data: [Date] = []
    @State private var showAddEventPage: Bool = false
    @EnvironmentObject var store: Store
    
    init(year: Int) {
        self.year = year
        let calendar = Calendar(identifier: .gregorian)
        let start = DateComponents(calendar: calendar, year: year)
        let currentYear = calendar.date(from: start)!
        var nextComponents = start
        nextComponents.year? += 1
        nextComponents.month? = 1
        nextComponents.day? = 1
        let nextYear = calendar.date(from: nextComponents)!
        let step: Double = 24 * 60 * 60
        _data = State(
            initialValue: stride(
                from: currentYear,
                to: nextYear,
                by: step
            ).map({ $0 })
        )
    }
    
    var body: some View {
        if data.isEmpty { 
            Text("No Dates") 
        } else {
            ZStack {
                List(data) { date in
                    let dayOfWeek = DayOfWeek(date: date)!
                    let calendar = Calendar(identifier: .gregorian)
                    let day = calendar.component(.day, from: date)
                    let dayEvents = store.events.filter { event in
                        calendar.isDate(date, inSameDayAs: event.startAt)
                    }
                    let isToday = calendar.isDateInToday(date)
                    DayCell(
                        title: dayOfWeek.rawValue,
                        dayOfWeek: dayOfWeek,
                        day: day,
                        events: dayEvents,
                        isToday: isToday
                    ) { event in
                        selectedDate = event.startAt
                    }
                }
                Button { 
                    showAddEventPage = true
                } label: { 
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddEventPage) { 
                showAddEventPage = false
            } content: { 
                
            }
            
        }
    }
}

enum DayOfWeek: String {
    case sunday = "日"
    case monday = "月"
    case tuesday = "火"
    case wednesday = "水"
    case thursday = "木"
    case friday = "金"
    case saturday = "土"
    
    var color: Color {
        switch self {
        case .sunday:
            return Color.red
        case .monday:
            return Color.orange
        case .tuesday:
            return Color.blue
        case .wednesday:
            return Color.cyan
        case .thursday:
            return Color.brown
        case .friday:
            return Color.yellow
        case .saturday:
            return Color.teal
        }
    }
    
    init?(date: Date) {
        let calendar = Calendar(identifier: .gregorian)
        let dayOfWeek = calendar.component(.weekday, from: date)
        switch dayOfWeek {
        case 1:
            self = .sunday
        case 2:
            self = .monday
        case 3:
            self = .tuesday
        case 4:
            self = .wednesday
        case 5:
            self = .thursday
        case 6:
            self = .friday
        case 7:   
            self = .saturday
        default:
            return nil
        }
    }
}

extension CalendarView {
    struct DayCell: View {
        
        let title: String
        let dayOfWeek: DayOfWeek
        let day: Int
        let events: [Event]
        let isToday: Bool
        let didTapEvent: (Event) -> Void
        
        var body: some View {
            HStack {
                VStack(spacing: 0) {
                    Text(title).bold()
                    Text("\(day)")
                        .bold()
                        .font(.title3)
                        .padding(4)
                        .background(isToday ? Color.accentColor : Color.clear)
                        .clipShape(Circle())
                }
                Spacer().frame(width: 16)
                ForEach(events) { event in
                    ZStack {
                        Spacer().frame(height: 4)
                        Text(event.name).bold().font(.title3)
                        Text(event.startAt, style: .time).bold().font(.title3)
                    }.onTapGesture {
                        didTapEvent(event)
                    }
                    .background(dayOfWeek.color)
                    .frame(height: 64)
                }
            }
        }
    }
}
