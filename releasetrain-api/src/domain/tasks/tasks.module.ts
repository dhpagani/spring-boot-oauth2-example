import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Task } from './task.entity';
import { TasksRepository } from './tasks.repository';
import { TasksService } from './tasks.service';

@Module({
    imports: [TypeOrmModule.forFeature([Task])],
    providers: [TasksService, TasksRepository],
    exports: [TasksService],
})
export class TasksModule {}
